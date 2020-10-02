--[[
BY : TshAkETEAM
Channel Files : https://t.me/tshakeFiles
]]
local function keko_tshake(data)
local msg = data.message_
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
https = require("ssl.https")
bot_id_keko = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_id_keko[1])
JSON = (loadfile  "./libs/dkjson.lua")()
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
local msg = data.message_
text = msg.content_.text_
if (text and msg.reply_to_message_id_ ~= 0) then 
  local keko = database:get('tshake:'..bot_id.. msg.chat_id_.."keko:re"..text)
  if keko then 
  send(msg.chat_id_, msg.reply_to_message_id_, 1, keko, 1, 'md')
end
end

if text == "مسح ردود الرد بالرد" and is_creator(msg) then
local list = redis:smembers("tshake"..bot_id.."rd:rp"..msg.chat_id_)
for k,v in pairs(list) do
database:del('tshake:'..bot_id.. msg.chat_id_.."keko:re"..v)
database:srem("tshake"..bot_id.."rd:rp"..msg.chat_id_,v)
  end
 send(msg.chat_id_, msg.id_, 1, "• `تم مسح ردود الرد بالرد` 🗑", 1, 'md')
    end
if  text == "ردود الرد بالرد" and is_creator(msg) then
    local list = database:smembers("tshake"..bot_id.."rd:rp"..msg.chat_id_)
    text = "💾┇قائمة ردود الرد بالرد ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
    for k,v in pairs(list) do
  text = text.."*|"..k.."|*~⪼("..v..")\n"
	  if #text > 7000 then
    send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
	text = ""
	end
    end
    if #list == 0 then
  text = "✖┇لايوجد ردود رد بالرد"
  end
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
  end
  
if (text and text == 'اضف رد بالرد' and  is_creator(msg) ) then 
  send(msg.chat_id_, msg.id_, 1, '📜┇الان ارسل الكلمه', 1, 'md')
database:set('tshake:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_,"yes")
  return false
end  
if text then 
local keko = database:get('tshake:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_)
if keko == 'yes' then 
  send(msg.chat_id_, msg.id_, 1, "📥┇الان ارسل الرد", 1, 'md')
database:set('tshake:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_,"yes2")
database:set('tshake:'..bot_id.. msg.chat_id_.."keko:add2"..msg.sender_user_id_, text)
  return false
end
end
if text then 
  local keko = database:get('tshake:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_)
  if keko == 'yes2' then 
    send(msg.chat_id_, msg.id_, 1, "☑️┇تم الحفظ", 1, 'md')
database:del('tshake:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_)
local keko = database:get('tshake:'..bot_id.. msg.chat_id_.."keko:add2"..msg.sender_user_id_)
database:set('tshake:'..bot_id.. msg.chat_id_.."keko:re"..keko,text)
database:del('tshake:'..bot_id.. msg.chat_id_.."keko:add2"..msg.sender_user_id_)
database:sadd("tshake"..bot_id.."rd:rp"..msg.chat_id_,text)
    return false
  end
  end
    if (text and text == 'حذف رد بالرد' and is_creator(msg) ) then
      send(msg.chat_id_, msg.id_, 1, '📜┇الان ارسل الكلمه', 1, 'md')
      database:set('tshake:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_,"yes3")
      return false
    end  
    if text then 
    local keko = database:get('tshake:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_)
if (keko and keko == 'yes3') then 
send(msg.chat_id_, msg.id_, 1, "☑️┇تم الحذف", 1, 'md')
database:del('tshake:'..bot_id.. msg.chat_id_.."keko:add"..msg.sender_user_id_)
database:del('tshake:'..bot_id.. msg.chat_id_.."keko:re"..text)
database:srem("tshake"..bot_id.."rd:rp"..msg.chat_id_,text)
      return false
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
