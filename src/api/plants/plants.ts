import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export type FindManyPlantsArgs = {
	page?: number;
};

export type CreatePlantArgs = {
	name: string
}

export const findManyPlantsHandler = (args?: FindManyPlantsArgs) => {
  const take = 30; 
  const page = args && args.page || 0
  const skip = page * take;

  return prisma.plant.findMany({
    skip: skip,
    take: take,
  });
};

export const createPlantHandler = (args:  CreatePlantArgs) => {
	return prisma.plant.create({ data: args });
}