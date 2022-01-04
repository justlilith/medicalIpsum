// rollup.config.js

import { defineConfig } from 'rollup';
import copy from 'rollup-plugin-copy'

export default defineConfig({
  input: './app/lib/rollup.js',
  output: {
    file: './app/lib/rollup.js',
    format: 'cjs'
  },
  plugins: [
    copy({
      verbose: true,
      // flatten: false,
      targets: [
        { src: './app/lib/assets/static/**/*', dest: './dist/public' }
      ]
    })
  ]
})