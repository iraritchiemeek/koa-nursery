import Router from '@koa/router'
import * as handlers from './handlers'

const router = new Router({
  prefix: '/plants'
})

router
  .get('/', async (ctx, next) => {
    ctx.body = await handlers.findManyPlants()
  })
  .post('/', async (ctx, next) => {
    const body = ctx.request.body
    console.log(body)
    const plant = await handlers.createPlant(body)
    ctx.response.status = 200
  })

export default router
