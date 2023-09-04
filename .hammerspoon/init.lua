wifiWatcher = nil
lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID ~= lastSSID then
        if newSSID then
           alertSound:play()
           hs.alert.show("SSID changed to " .. newSSID)
           wifiMenu:setTitle(newSSID)
        end
    end

    lastSSID = newSSID
end

wifiMenu = hs.menubar.new()
alertSound = hs.sound.getByName('Glass')
wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
