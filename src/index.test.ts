import { hello } from './index';

it('says hello', async () => {
  expect(hello()).toEqual('hello');
});
