import { 
	findManyPlants, FindManyPlantsArgs,
	createPlant, CreatePlantArgs
} from './plants';

export const getPlants = async (args?: FindManyPlantsArgs) => await findManyPlants(args);

export const postPlant = async (args: CreatePlantArgs) => await createPlant(args);
