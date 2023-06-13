import type { Config } from '@jest/types'

const config: Config.InitialOptions = {
  testEnvironment: 'node',
  // set explicitly in npm scripts
  collectCoverage: false,
  coverageDirectory: './coverage',
  collectCoverageFrom: ['<rootDir>/src/**/*.ts'],
  rootDir: './',
  testMatch: ['<rootDir>/test/**/*.test.ts'],
  clearMocks: true,
  setupFilesAfterEnv: ['<rootDir>/test/setup-jest.ts'],
  reporters: ['default', 'github-actions'],
  transform: { '^.+\\.(t|j)sx?$': '@swc/jest' },
  maxWorkers: '50%',
  passWithNoTests: true,
}

export default config

