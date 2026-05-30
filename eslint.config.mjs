/**
 * ESLint configuration for JavaScript blocks in Creative Button-Card Templates.
 * This configuration is tailored for the specific environment and coding style used in the dashboards templates.
 * It includes rules for best practices, potential errors, and code style preferences.
 */

export default [
  {
    files: [
      '**/*.yaml.button-card-*.js',
      '**/*.yml.button-card-*.js'
    ],

    languageOptions: {
      ecmaVersion: 'latest',
      sourceType: 'script',
      globals: {
        entity: 'readonly',
        entities: 'readonly',
        states: 'readonly',
        variables: 'readonly',
        user: 'readonly',
        hass: 'readonly',
        config: 'readonly',
        helpers: 'readonly',

        console: 'readonly',
        window: 'readonly',
        document: 'readonly',
        localStorage: 'readonly',
        setTimeout: 'readonly',
        clearTimeout: 'readonly',
        setInterval: 'readonly',
        clearInterval: 'readonly',
        fetch: 'readonly',

        cbcJS: 'readonly',
        CBCError: 'readonly',
        CBCWarn: 'readonly',
      }
    },

    rules: {
      'no-undef': 'error',
      'no-unused-vars': ['warn', {
        args: 'none',
        varsIgnorePattern: '^_',
        caughtErrors: 'none'
      }],
      'no-redeclare': 'error',
      'no-unreachable': 'error',
      'no-constant-condition': 'warn',
      eqeqeq: ['warn', 'smart'],
      curly: ['warn', 'multi-line'],
      'no-var': 'error',
      'prefer-const': 'warn',
      'object-shorthand': 'warn',
      'no-console': 'off'
    }
  }
];