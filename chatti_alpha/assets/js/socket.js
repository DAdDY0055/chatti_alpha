import {Socket} from "phoenix"

let socket = new Socket("/socket", { params: { room_id: window.roomId } })
// TODO: コネクトに何か値を渡してしたいか？

socket.connect()

let LoginRoom = `room:${window.roomId}`

let channel = socket.channel(LoginRoom, {})
let userInput         = window.userName
let chatInput         = document.querySelector("#chat-input")
let messagesContainer = document.querySelector("#messages")

// メッセージの枠でEnterを押すとメッセージが送信される

// メッセージは空にする(ユーザー名はそのまま)
chatInput.addEventListener("keypress", event => {
  if(event.keyCode === 13){
    channel.push("new_msg", {user_name: window.userName, post: chatInput.value})
    chatInput.value = ""
  }
})

// TODO: 送信ボタンでも送信できるように

// TODO: 空文字だと送信できないようにする
channel.on("new_msg", payload => {
  let messageItem = document.createElement("li")
  messageItem.innerText = `[${payload.user_name}] ${payload.post}`
  messagesContainer.appendChild(messageItem)
})

channel.join()
  .receive("ok", resp => console.log("Joined successfully", resp))
  .receive("error", resp => console.log("Unable to join", resp))

export default socket
