local function AddMe(msg)
local text = msg.content_.text_
if text == 'تفعيل ضافني' and Owner(msg) then   
redis:del(bot_id..'Casper:Lock:Added:Me'..msg.chat_id_)  
send(msg.chat_id_, msg.id_,'☑┇تم تفعيل امر منو ضافني') 
return false
end
if text == 'تعطيل ضافني' and Owner(msg) then  
redis:set(bot_id..'Casper:Lock:Added:Me'..msg.chat_id_,true)  
send(msg.chat_id_, msg.id_,'☑┇تم تعطيل امر منو ضافني') 
return false
end

if text and text:match("(.*)(ضافني)(.*)") then
if not redis:get(bot_id..'Casper:Lock:Added:Me'..msg.chat_id_) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusCreator" then
send(msg.chat_id_, msg.id_,'📛┇انت منشئ المجموعه ') 
return false
end
local Added_Me = redis:get(bot_id.."Casper:Who:Added:Me"..msg.chat_id_..':'..msg.sender_user_id_)
if Added_Me then 
tdcli_function ({ID = "GetUser",user_id_ = Added_Me},function(extra,result,success)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
Text = '👤┇الشخص الذي قام باضافتك هو » '..Name
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
else
send(msg.chat_id_, msg.id_,'🔰┇انت دخلت عبر الرابط') 
end
end,nil)
else
send(msg.chat_id_, msg.id_,'⚠┇امر منو ضافني تم تعطيله من قبل المدراء ') 
end
end



end
return {CasperFile = AddMe}