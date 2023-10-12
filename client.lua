addEvent("onClientStartCountDown", true)
addEventHandler("onClientStartCountDown", localPlayer, function()
    local sW, sH = guiGetScreenSize()
    local x, y = (sW/1920), (sH/1080)

    local bold = dxCreateFont("font/bold.ttf", x*15, false, "proof")

    local countdownTime = config["timeWanted"]
    local countdownTimer = nil

    function updateCountdown()
        countdownTime = countdownTime - 1

        if countdownTime == 0 then
            removeEventHandler("onClientRender", root, renderPanel)
            countdownTimer = nil
            triggerServerEvent("onServerRemoveWanted", localPlayer, localPlayer)
        end
    end

    local svg = {
        ["policeIcon"] = svgCreate(30, 30, [[
            <svg width="37" height="37" viewBox="0 0 37 37" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M37 3.7L33.3 0C31.1725 1.184 28.49 1.85 25.9 1.85C23.31 1.85 20.609 1.1655 18.5 0C16.391 1.1655 13.69 1.85 11.1 1.85C8.51 1.85 5.8275 1.184 3.7 0L0 3.7C0 3.7 3.7 7.4 3.7 11.1C3.7 14.8 0 22.2 0 25.9C0 33.3 18.5 37 18.5 37C18.5 37 37 33.3 37 25.9C37 22.2 33.3 14.8 33.3 11.1C33.3 7.4 37 3.7 37 3.7ZM24.1425 26.7325L18.4445 23.2915L12.765 26.7325L14.282 20.2575L9.25 15.9285L15.873 15.355L18.4445 9.25L21.0345 15.3365L27.6575 15.91L22.6255 20.239L24.1425 26.7325Z" fill="white"/>
            </svg>
        ]])
    }

    function renderPanel()
        dxDrawRoundedRectangle(x*1583, y*479, x*311, y*122, tocolor(81, 81, 81, 132), 10)
        dxDrawImage(x*1609, y*493, x*37, y*37, svg["policeIcon"])
        dxDrawText("Você está procurado", x*1591, y*479, x*1894, y*544, tocolor(255, 255, 255, 255), 1, bold, "center", "center")
        dxDrawText("Restam: "..tostring(countdownTime).." minutos", x*1583, y*544, x*1894, y*601, tocolor(255, 255, 255, 255), 1, bold, "center", "center")
    end
    addEventHandler("onClientRender", root, renderPanel)

    function dxDrawRoundedRectangle(x, y, rx, ry, color, radius, type)
        realRY = ry
        realY = y
        rx = rx - radius * 2
        ry = ry - radius * 2
        x = x + radius
        y = y + radius
        if (rx >= 0) and(ry >= 0) then
            dxDrawRectangle(x, y, rx, ry, color)
            dxDrawRectangle(x, y - radius, rx, radius, color)
            dxDrawRectangle(x, y + ry, rx, radius, color)
            dxDrawRectangle(x - radius, y, radius, ry, color)
            dxDrawRectangle(x + rx, y, radius, ry, color)
            dxDrawCircle(x, y, radius, 180, 270, color, color, 7)
            dxDrawCircle(x + rx, y, radius, 270, 360, color, color, 7)
            dxDrawCircle(x + rx, y + ry, radius, 0, 90, color, color, 7)
            dxDrawCircle(x, y + ry, radius, 90, 180, color, color, 7)
        end
    end

    function startCountdown(time)
        countdownTime = time
        countdownTimer = setTimer(updateCountdown, 60000, countdownTime)
    end
    startCountdown(countdownTime)
end)