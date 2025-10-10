import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saint_flutter/di/providers.dart';
import 'package:saint_flutter/gen_l10n/app_localizations.dart';

import '../../../application/auth/auth_state.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final ProviderSubscription<AuthState> _subscription;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'demo@saint.com');
  final _passwordController = TextEditingController(text: 'demo123');
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _subscription = ref.listenManual<AuthState>(authControllerProvider, (
      previous,
      next,
    ) {
      next.maybeWhen(
        error: (message) {
          if (!mounted) {
            return;
          }
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        },
        orElse: () {},
      );
    });
  }

  @override
  void dispose() {
    _subscription.close();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final form = _formKey.currentState;
    if (form == null) {
      return;
    }
    if (!form.validate()) {
      return;
    }
    await ref
        .read(authControllerProvider.notifier)
        .login(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final l10n = AppLocalizations.of(context);

    final isLoading = authState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n?.loginTitle ?? 'Iniciar sesion',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.username],
                      decoration: InputDecoration(
                        labelText: l10n?.emailLabel ?? 'Correo',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n?.emailRequired ?? 'Correo requerido';
                        }
                        if (!value.contains('@')) {
                          return l10n?.emailInvalid ?? 'Correo invalido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscure,
                      autofillHints: const [AutofillHints.password],
                      decoration: InputDecoration(
                        labelText: l10n?.passwordLabel ?? 'Contrasena',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscure ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () => setState(() => _obscure = !_obscure),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return l10n?.passwordRequired ??
                              'Contrasena requerida';
                        }
                        if (value.length < 4) {
                          return l10n?.passwordShort ?? 'Minimo 4 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: isLoading ? null : _submit,
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(l10n?.loginButton ?? 'Entrar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
