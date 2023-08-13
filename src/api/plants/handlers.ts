import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export const getPlants = async () => await prisma.plant.findMany() 