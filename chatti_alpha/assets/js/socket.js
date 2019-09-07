import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

socket.connect()

let channel           = socket.channel("room:*", {})
let userInput         = document.querySelector("#user-input")
let chatInput         = document.querySelector("#chat-input")
let messagesContainer = document.querySelector("#messages")

// メッセージの枠でEnterを押すとメッセージが送信される

// メッセージは空にする(ユーザー名はそのまま)
chatInput.addEventListener("keypress", event => {
  if(event.keyCode === 13){
    channel.push("new_msg", {user_name: userInput.value, post: chatInput.value})
    chatInput.value = ""
  }
})

// TODO: 送信ボタンでも送信できるように

// TODO: 空文字だと送信できないようにする
channel.on("new_msg", payload => {
  let messageItem = document.createElement("li")
  messageItem.innerText = `[${payload.user}] ${payload.chat}`
  messagesContainer.appendChild(messageItem)
})

channel.join()
  .receive("ok", resp => console.log("Joined successfully", resp))
  .receive("error", resp => console.log("Unable to join", resp))

export default socket
