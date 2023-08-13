import Router from '@koa/router'
import * as handlers from './handlers'

const router = new Router({
  prefix: '/plants'
})

router.get('/', async (ctx, next) => {
  ctx.body = await handlers.getPlants()
})

export default router
