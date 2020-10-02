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
  function is_owner(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)  
local owner = database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id)  
if owner then var = true
end if admin then
var = true end if creator then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end end
local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
local msg = data.message_
text = msg.content_.text_
if not database:get('tshake:'..bot_id..'rep:mute'..msg.chat_id_) then
if text == 'هلو' then
moody = "هلاوات 🌚👋🏻"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شلونكم' then
moody = "تمام وانت يكيوت ؟ 💕"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شكو ماكو' then
moody = "نسأل عنك يحلو  💘"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'بوت' then
moody = "عمري تفضل ؟🙁"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'صباح الخير' then
moody = "اطلق صباح 💘"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'صباح النور' then
moody = "اطلق صباح 💘"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'صباح النور ' then
moody = "اطلق صباح 💘"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'سلام عليكم'then
moody = 'عليكم السلام'
send (msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'فديت'then
moody = 'فداك 💘' 
send (msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'ها' then
moody = "ها يروحي"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end

if text == 'احبك' then
moody = "عيب🌚💘"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شلونك' then
moody = "اكيد راح يكلك تمام🌚"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شلونج' then
moody = "اكيد حتكلك مو تمام🌚"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'تمام' then
moody = "العار ما يصيرله شي🤣"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'هلاو' then
moody = "اطلق هلاو💘"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😐' then
moody = "اربط فيشه🌚👋🏻"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'هاي' then
moody = "اطلق هاي💕"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'وينكم' then
moody = "شعليك بيهم🙁"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'اريد اكبل' then
moody = "سوالف الكوكو عوفها"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'لتزحف' then
moody = "ولا يكعد الثكيل 😹"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'كلخرا' then
moody = "دعبل"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'زاحف' then
moody = "عاشت الاسامي😹"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'دي' then
moody = "ديصيحوك"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'فرخ' then
moody = "منو صاح اسمك"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'تعالي خاص' then
moody = "اجي وياكم 🌝"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'اكرهك' then
moody = "عليك الله حبني😿"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'نرتبط' then
moody = "مرتبط وية نفسي🌚👋🏻"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'باي' then
moody = "باي حبيبي"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'واكف' then
moody = "استريح"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'وين المدير' then
moody = "بحظني"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'انجب' then
moody = "دعبل"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'تحبني' then
moody = "ما ادور حدث☺️"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🌚' then
moody = "منورة صورتك"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🙄' then
moody = "باوع كدامك"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😒' then
moody = "شكلك من تكعد من النوم"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😳' then
moody = "شبيك😕"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🚶💔' then
moody = "حركات مال نفسيه بطلوهن😒"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🙂' then
moody = "ها كانسر"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🌝' then
moody = "صورتي من جنت صغير"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'صباحو' then
moody = "اطلق صباح💘"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'كفو' then
moody = "منك حبيبي👋🏻"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😌' then
moody = "وجه زربة"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'اها' then
moody = "وداعتها للحجيه"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
end
if  (text and text == 'تفعيل الردود') and is_owner(msg) then
    if not database:get('tshake:'..bot_id..'rep:mute'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, 'ردود البوت مفعله سابقا', 1, 'md')
    else
  send(msg.chat_id_, msg.id_, 1, 'تم تفعيل الردود', 1, 'md')
   database:del('tshake:'..bot_id..'rep:mute'..msg.chat_id_)
  end
  end
  if(text and text == 'تعطيل الردود') and is_owner(msg) then
    if database:get('tshake:'..bot_id..'rep:mute'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, 'ردود البوت معطله سابقا', 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, 'تم تعطيل الردود', 1, 'md')
    database:set('tshake:'..bot_id..'rep:mute'..msg.chat_id_,true)
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
