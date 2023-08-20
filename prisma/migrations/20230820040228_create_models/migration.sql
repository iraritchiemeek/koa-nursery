-- CreateEnum
CREATE TYPE "OrderStatus" AS ENUM ('AWAITING_PAYMENT', 'PAID', 'SHIPPED');

-- AlterTable
ALTER TABLE "Plant" ADD COLUMN     "price" DOUBLE PRECISION NOT NULL DEFAULT 0;

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Nursery" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Nursery_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Stock" (
    "id" SERIAL NOT NULL,
    "quantity" INTEGER NOT NULL,
    "plantId" INTEGER NOT NULL,
    "nurseryId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Stock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Order" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "status" "OrderStatus" NOT NULL DEFAULT 'AWAITING_PAYMENT',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderItem" (
    "id" SERIAL NOT NULL,
    "orderId" INTEGER NOT NULL,
    "stockId" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,

    CONSTRAINT "OrderItem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Stock" ADD CONSTRAINT "Stock_plantId_fkey" FOREIGN KEY ("plantId") REFERENCES "Plant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Stock" ADD CONSTRAINT "Stock_nurseryId_fkey" FOREIGN KEY ("nurseryId") REFERENCES "Nursery"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderItem" ADD CONSTRAINT "OrderItem_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderItem" ADD CONSTRAINT "OrderItem_stockId_fkey" FOREIGN KEY ("stockId") REFERENCES "Stock"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
