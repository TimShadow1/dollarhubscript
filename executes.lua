local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local function detectExecutor()
    return identifyexecutor() or "NN Executor"
end

local function createWebhookData(player)
    local playerName = player.Name
    local gameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
    local gameName = gameInfo.Name
    local executor = detectExecutor()
    local date = os.date("%m/%d/%Y")
    local time = os.date("%X")

    local data = {
        username = "Dollarhub executes",
        avatar_url = "",
        embeds = {
            {
                title = "🔔 Новый экзекьют!",
                description = string.format(
                    "**Никнейм:** %s\n**Игра:** %s\n**Инжектор:** %s",
                    playerName, gameName, executor
                ),
                color = tonumber("0x2ecc71"),
                footer = { 
                    text = string.format("📅 Дата: %s | ⏰ Время: %s", date, time)
                }
            }
        }
    }
    return HttpService:JSONEncode(data)
end

local function sendWebhook(webhookUrl, data)
    local headers = {["Content-Type"] = "application/json"}
    local request = http_request or request or HttpPost or syn.request
    local webhookRequest = {Url = webhookUrl, Body = data, Method = "POST", Headers = headers}
    request(webhookRequest)
end

local webhookUrl = "https://discord.com/api/webhooks/1416081121015496764/ih_uGtaRgo2EU_Zfxq1bTngzApLBA8uKg0aEHn1dARxZnxXeOyMdA_-2BbA5KjhRepML"

local LocalPlayer = Players.LocalPlayer
if LocalPlayer then
    local webhookData = createWebhookData(LocalPlayer)
    sendWebhook(webhookUrl, webhookData)
end
