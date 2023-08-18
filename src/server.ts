import Koa from 'koa';
import { bodyParser } from "@koa/bodyparser";
import plantsRouter from './api/plants/routes' 

const app = new Koa();
app.use(bodyParser());
app.use(plantsRouter.routes()).use(plantsRouter.allowedMethods());
app.listen(3000);

