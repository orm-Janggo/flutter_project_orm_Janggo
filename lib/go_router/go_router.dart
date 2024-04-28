import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/login_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/main_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_in/sign_in_screen.dart';
import 'package:go_router/go_router.dart';

import '../presentation/recipe_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return SignInScreen();
            // return SignInScreen(
            //   actions: [
            //     ForgotPasswordAction(((context, email) {
            //       final uri = Uri(
            //         path: '/sign-in/forgot-password',
            //         queryParameters: <String, String?>{
            //           'email': email,
            //         },
            //       );
            //       context.push(uri.toString());
            //     })),
            //     AuthStateChangeAction(((context, state) {
            //       final user = switch (state) {
            //         SignedIn state => state.user,
            //         UserCreated state => state.credential.user,
            //         _ => null
            //       };
            //       if (user == null) {
            //         return;
            //       }
            //       if (state is UserCreated) {
            //         user.updateDisplayName(user.email!.split('@')[0]);
            //       }
            //       if (!user.emailVerified) {
            //         user.sendEmailVerification();
            //         const snackBar = SnackBar(
            //             content: Text(
            //                 'Please check your email to verify your email address'));
            //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //       }
            //       context.pushReplacement('/');
            //     })),
            //   ],
            // );
          },
        ),
        GoRoute(
          path: 'main',
          builder: (context, state) {
            return MainScreen();
          },
          routes: [
            GoRoute(
              path: 'recipe',
              builder: (context, state) {
                return RecipeScreen();
              },
            ),
          ]
        ),

      ],
    ),
  ],
);
