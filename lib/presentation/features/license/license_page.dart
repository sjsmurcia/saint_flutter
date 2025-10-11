
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../application/license/license_state.dart';
import '../../../di/providers.dart';
import '../../../domain/models/license_info.dart';
import '../../../domain/models/license_info_extensions.dart';

class LicensePage extends ConsumerStatefulWidget {
  const LicensePage({super.key});

  @override
  ConsumerState<LicensePage> createState() => _LicensePageState();
}

class _LicensePageState extends ConsumerState<LicensePage> {
  final _formKey = GlobalKey<FormState>();
  final _licenseKeyController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _licenseKeyController.dispose();
    super.dispose();
  }

  Future<void> _activate() async {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) {
      return;
    }

    setState(() => _isSubmitting = true);
    try {
      await ref
          .read(licenseControllerProvider.notifier)
          .activate(_licenseKeyController.text.trim());
    } catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _checkIn() async {
    await ref.read(licenseControllerProvider.notifier).checkIn(force: true);
  }

  @override
  Widget build(BuildContext context) {
    final licenseState = ref.watch(licenseControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activacion de licencia'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: _buildBody(context, licenseState),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, LicenseState state) {
    return state.map(
      unknown: (_) => const _LoadingIndicator(),
      loading: (_) => const _LoadingIndicator(),
      inactive: (_) => _ActivationForm(
        formKey: _formKey,
        controller: _licenseKeyController,
        isSubmitting: _isSubmitting,
        onSubmit: _activate,
        message:
            'Introduce tu llave de licencia para habilitar la aplicacion en este dispositivo.',
      ),
      active: (active) => _ActiveLicenseView(
        info: active.info,
        checkInDue: active.checkInDue,
        onCheckIn: _checkIn,
        onContinue: () {
          if (!mounted) {
            return;
          }
          final authState = ref.read(authControllerProvider);
          final destination = authState.maybeWhen(
            authenticated: (_) => '/home',
            orElse: () => '/login',
          );
          context.go(destination);
        },
      ),
      expired: (expired) => _ActivationForm(
        formKey: _formKey,
        controller: _licenseKeyController,
        isSubmitting: _isSubmitting,
        onSubmit: _activate,
        message:
            'La licencia ${expired.info.licenseId} ha expirado. Ingresa una licencia valida para continuar.',
      ),
      graceExpired: (grace) => _ActivationForm(
        formKey: _formKey,
        controller: _licenseKeyController,
        isSubmitting: _isSubmitting,
        onSubmit: _activate,
        message:
            'El periodo de gracia termino el ${grace.info.graceDeadline.toLocal()}. Renueva o reactiva la licencia.',
      ),
      error: (error) => _ActivationForm(
        formKey: _formKey,
        controller: _licenseKeyController,
        isSubmitting: _isSubmitting,
        onSubmit: _activate,
        message:
            'Ocurri un problema con la licencia: ${error.message}. Intenta activarla nuevamente.',
      ),
    );
  }
}

class _ActivationForm extends StatelessWidget {
  const _ActivationForm({
    required this.formKey,
    required this.controller,
    required this.isSubmitting,
    required this.onSubmit,
    required this.message,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final bool isSubmitting;
  final VoidCallback onSubmit;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Llave de licencia',
              hintText: 'Ejemplo: SAINT-TRIAL-001',
            ),
            textCapitalization: TextCapitalization.characters,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'La llave de licencia es obligatoria';
              }
              if (value.trim().length < 6) {
                return 'La llave proporcionada es demasiado corta';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: isSubmitting ? null : onSubmit,
          child: isSubmitting
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Activar licencia'),
        ),
      ],
    );
  }
}

class _ActiveLicenseView extends StatelessWidget {
  const _ActiveLicenseView({
    required this.info,
    required this.checkInDue,
    required this.onCheckIn,
    required this.onContinue,
  });

  final LicenseInfo info;
  final bool checkInDue;
  final VoidCallback onCheckIn;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Licencia activa',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                Text('ID: ${info.licenseId}'),
                Text('Tenant: ${info.tenantId}'),
                Text('Tipo: ${info.licenseType}'),
                Text(
                  'Vence: ${info.expiresAt.toLocal()}',
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: info.entitlements
                      .map(
                        (entitlement) => Chip(
                          avatar: const Icon(Icons.verified_outlined, size: 16),
                          label: Text(entitlement),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        if (checkInDue) ...[
          FilledButton.icon(
            onPressed: onCheckIn,
            icon: const Icon(Icons.refresh),
            label: const Text('Validar licencia ahora'),
          ),
          const SizedBox(height: 12),
          Text(
            'Ultima validacion: ${info.lastCheckInAt.toLocal()}.\nSe requiere validar para evitar restricciones.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
        const SizedBox(height: 24),
        FilledButton(
          onPressed: onContinue,
          child: const Text('Continuar'),
        ),
      ],
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

