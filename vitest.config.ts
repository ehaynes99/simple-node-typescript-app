import { defineConfig } from 'vitest/config'

export default defineConfig({
  test: {
    clearMocks: true,
    include: ['./test/**/*.test.ts'],
    env: {
      ENVIRONMENT: 'test',
    },
  },
})
