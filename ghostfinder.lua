local function menuable_tap()
    
    local tw = TextWindow.new("Mastoid & KLS's EU4 Ghost Finder")

    local ips = {}
    local dumpers = {}
    local ran = false
    local myip = ""

    local tap = Listener.new("udp");

    local function remove()

        tap:remove();

    end

    tw:set_atclose(remove)

    local function getname(str)

        if str then

            local a, b = str:match("(.+)6E2801004B28(.+)")
            local newstr = a:sub(1, a:len() - 20)
            newstr:reverse()
            local c, d = newstr:match("(.+)00(.+)")
            d:reverse()

            return Struct.fromhex(d) or "invalid name"

        end    

    end

    function tap.packet(pinfo, tvb, tapinfo)

        local tvbr = tvb:range()
        local tvbrbytes = tvbr:bytes()
        local tvbrstr = tostring(tvbrbytes)
        local src = tostring(pinfo.src)

        if src and tvbrstr:find("6E2801004B28") then

            if not ran then

                ran = true
                myip = src

            end

            local name = getname(tvbrstr)

            if not ips[src] then

                ips[src] = name

            --elseif src ~= myip and ips[src] and name:len() == 0 then

                --ips[src] = name

            end

        end

    end

    function tap.draw(t)
        
        tw:clear()

        for k, v in pairs(ips) do

            tw:append(k .. "\t" .. v .. "\n");

        end

    end

    function tap.reset()

        tw:clear()
        ips = {}

    end

    retap_packets()

end

register_menu("EU4/Ghost Finder", menuable_tap, MENU_TOOLS_UNSORTED)