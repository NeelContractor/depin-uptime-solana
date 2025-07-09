import { prismaClient } from "../src";

const USER_ID = "5";

async function seed() {
    await prismaClient.user.create({
        data: {
            id: USER_ID,
            email: "test@gmail.com",
        }
    })

    const validator = await prismaClient.validator.create({
        data: {
            publicKey: "0x122357862358723459",
            location: "Gujarat",
            ip: "127.0.0.1"
        }
    })

    const website = await prismaClient.website.create({
        data: {
            url: "https://test.com",
            userId: USER_ID,
        }
    })

    await prismaClient.websiteTrick.create({
        data: {
            websiteId: website.id,
            status: "Good",
            createdAt: new Date(),
            latency: 100,
            validatorId: validator.id
        }
    })

    await prismaClient.websiteTrick.create({
        data: {
            websiteId: website.id,
            status: "Good",
            createdAt: new Date(Date.now() - 1000 * 60 * 10),
            latency: 100,
            validatorId: validator.id
        }
    })

    await prismaClient.websiteTrick.create({
        data: {
            websiteId: website.id,
            status: "Bad",
            createdAt: new Date(Date.now() - 1000 * 60 * 20),
            latency: 100,
            validatorId: validator.id
        }
    })
}

seed();