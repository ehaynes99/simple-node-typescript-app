import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    clearMocks: true,
    include: ['./test/**/*.test.ts'],
    setupFiles: ['./test/setup-vitest.ts'],
    env: {
      ENVIRONMENT: 'test',
    },
  },
})
