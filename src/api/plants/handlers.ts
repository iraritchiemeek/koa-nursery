import { 
	findManyPlantsHandler, FindManyPlantsArgs,
	createPlantHandler, CreatePlantArgs
} from './plants';

export const findManyPlants = async (args?: FindManyPlantsArgs) => await findManyPlantsHandler(args);

export const createPlant = async (args: CreatePlantArgs) => await createPlantHandler(args);

