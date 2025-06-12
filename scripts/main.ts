import "dotenv/config"

const { TEST } = process.env
function test(){
    console.log(TEST)
}

test()