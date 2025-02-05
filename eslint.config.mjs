import globals from "globals";
import pluginJs from "@eslint/js";
import jestPlugin from "eslint-plugin-jest";

export default [
  {
    files: ["**/*.js"],
    ignores: ["eslint.config.mjs"], // Exclude config from linting
    languageOptions: {
      sourceType: "commonjs",
      globals: {
        ...globals.node,
        ...globals.jest,
      },
    },
  },
  {
    files: ["tests/**/*.js"],
    ...jestPlugin.configs["flat/recommended"],
  },
  pluginJs.configs.recommended,
];
