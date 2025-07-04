import "dotenv/config"
import { fetchWithProxyUndici } from "../utils/ip"
import { setCookie } from "./cookie"
import { header } from "./header"

const { PROXY_URL } = process.env
const url = "https://tge.spheron.network/api/user/spin"

async function main() {
    const cookie = await setCookie()
    try {
        const response = await fetchWithProxyUndici({
            url: url,
            proxyUrl: PROXY_URL,
            method: "POST",
            headers: {
                ...header,
                "Content-Type": "application/json",
                "Cookie": cookie ||  ""
            },
            body: JSON.stringify({
                "type": "paid"
            })
        })
        const data = response.body
        console.dir(data, {depth: null})
    } catch (error) {
        console.error(error)
    }
}

main().catch(console.error)