--[[
BY : TshAkETEAM
Channel Files : https://t.me/tshakeFiles
]]
local function keko_tshake(data)
    local msg = data.message_
    redis = (loadfile "./libs/redis.lua")()
    database = Redis.connect('127.0.0.1', 6379)
    sudos = dofile('sudo.lua')
    JSON = (loadfile  "./libs/dkjson.lua")()
    bot_id_keko = {string.match(token, "^(%d+)(:)(.*)")}
    bot_id = tonumber(bot_id_keko[1])
    local function openChat(chat_id,dl_cb)
    tdcli_function ({
    ID = "GetChat",
    chat_id_ = chat_id
    }, dl_cb, nil)
    end
    function getUser(user_id, cb)
    tdcli_function ({
    ID = "GetUser",
    user_id_ = user_id
    }, cb, nil)
    end
    function is_creator(msg)
    user_id = msg.sender_user_id_
    chat_id = msg.chat_id_
    local var = false
    local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id) 
    local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)
    if creator then var = true end
    if admin then var = true end
    for k,v in pairs(sudo_users) do
    if user_id == v then var = true end end
    local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
    if keko_add_sudo then var = true end
    return var
    end
    local function getMessage(chat_id, message_id,cb)
    tdcli_function ({
    ID = "GetMessage",
    chat_id_ = chat_id,
    message_id_ = message_id
    }, cb, nil)
    end
    function getChatId(id)
    local chat = {}
    local id = tostring(id)
    if id:match('^-100') then
    local channel_id = id:gsub('-100', '')
    chat = {ID = channel_id, type = 'channel'}
    else
    local group_id = id:gsub('-', '')
    chat = {ID = group_id, type = 'group'}
    end
    return chat
    end
    local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
    local TextParseMode = {ID = "TextParseModeMarkdown"}
    tdcli_function ({
    ID = "SendMessage",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = disable_notification,
    from_background_ = 1,
    reply_markup_ = nil,
    input_message_content_ = {
    ID = "InputMessageText",
    text_ = text,
    disable_web_page_preview_ = disable_web_page_preview,
    clear_draft_ = 0,
    entities_ = {},
    parse_mode_ = TextParseMode,
    },
    }, dl_cb, nil)
    end
    function resolve_username(username,cb)
    tdcli_function ({
    ID = "SearchPublicChat",
    username_ = username
    }, cb, nil)
    end
    local msg = data.message_
    text = msg.content_.text_
    if not database:get("tshake:get:hms:gr:"..bot_id..msg.chat_id_) then 
    if text and text:match("^اهمس (.*) (.*)") then 
    text = text:gsub('@',"")
    keko_ts = {string.match(text, "اهمس (.*) (.*)")}
    function cb_tshake(t1,t2)
    if not t2.id_ then 
    send(msg.chat_id_, msg.id_, 1, "👤┇لا يوجد هاكذا معرف", 1, 'html')
    return "keko"
    end
    function tshake_jd(y1,y2)
    if (y2 and ((y2.status_ and y2.status_.ID == "ChatMemberStatusLeft") or y2.ID == "Error")) then 
    send(msg.chat_id_, msg.id_, 1, "👤┇المستخدم ليس في المجموعه", 1, 'html')
    return "keko"
    end
    tdcli_function ({
    ID="DeleteMessages",
    chat_id_= msg.chat_id_,
    message_ids_= {[0] = msg.id_}
    },
    dl_cb, nil)
    database:set("tshake:get:hms:msg:"..bot_id..msg.chat_id_..msg.id_..t2.id_,keko_ts[1])
    function bot_id_get(t11,t22)
    bot_username = (t22.username_ or "Tshakebot")
    function kekko(u1,u2)
    local id_send = msg.sender_user_id_
    if u2.username_ then 
    id_send = "@"..u2.username_
    end
    send(msg.chat_id_, msg.id_, 1, "🔘┇عزيزي ( @["..keko_ts[2].."] )\n📩┇هناك همسه لك من قبل ( ["..id_send.."] )\n📃┇[اضغط هنا لعرض الهمسه](https://t.me/"..bot_username.."?start=hms"..msg.chat_id_..msg.id_.."_"..t2.id_..").", 1, 'html')
    end
    getUser(msg.sender_user_id_, kekko)
    end
    getUser(bot_id, bot_id_get)
    end
    tdcli_function ({
    ID = "GetChatMember",
    chat_id_ = msg.chat_id_,
    user_id_ = t2.id_
    }, tshake_jd, nil)
    end
    resolve_username(keko_ts[2],cb_tshake)
    end
    end
    if text and text == "اهمس" then 
    send(msg.chat_id_, msg.id_, 1, "🏮┇يمكنك عمل همسه\n\n🕹┇اهمس الرساله معرف الشخص\n📥┇مثال : اهمس مرحبا @ikeko ", 1, 'html')
    end
    if text and text:match("/start hms(.*)_(%d+)") then 
    keko_ts = {string.match(text, "^/start hms(.*)_(%d+)")}
    if tonumber(msg.sender_user_id_) == tonumber(keko_ts[2]) then 
    kekol = database:get("tshake:get:hms:msg:"..bot_id..keko_ts[1]..keko_ts[2])
    if kekol then 
    send(msg.chat_id_, msg.id_, 1, "📥┇الهمسه هيه : ["..kekol.."]", 1, 'html')
    else 
    send(msg.chat_id_, msg.id_, 1, "🏮┇ الهمسه ليست لك", 1, 'html')
    end
    else 
    send(msg.chat_id_, msg.id_, 1, "🏮┇ الهمسه ليست لك", 1, 'html')
    end
    end

    if is_creator(msg) then 
    if text and text == "تعطيل اهمس" then 
    database:set("tshake:get:hms:gr:"..bot_id..msg.chat_id_,"tshake")
    send(msg.chat_id_, msg.id_, 1, "🔘┇ تم تعطيل اهمس", 1, 'html')
    end 
    if text and text == "تفعيل اهمس" then 
    database:del("tshake:get:hms:gr:"..bot_id..msg.chat_id_)
    send(msg.chat_id_, msg.id_, 1, "☑️┇ تم تفعيل اهمس ", 1, 'html')
    end 
    end

    end
    return {
        keko_tshake = keko_tshake,
    }
    --[[
    BY : TshAkETEAM
    Channel Files : https://t.me/tshakeFiles
    ]]
    