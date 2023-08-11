import Router from '@koa/router';

const router = new Router({
  prefix: '/plants'
});

router.get('/', async (ctx, next) => {
  ctx.body = 'Test'
})

export default router