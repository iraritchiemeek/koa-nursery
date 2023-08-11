import Koa from 'koa';
const app = new Koa();
import plantsRouter from './api/plants/routes.js'

app.use(plantsRouter.routes()).use(plantsRouter.allowedMethods());
app.listen(3000);

