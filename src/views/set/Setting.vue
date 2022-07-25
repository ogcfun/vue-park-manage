<template>
  <div id="set">
    <vue-draggable-resizable
      class="message"
      @dragging="onDrag"
      @resizing="onResize"
      :parent="true"
      :resizable="false"
      :w="900"
      :h="650"
    >
      <!-- 上 -->
      <div class="top-board" ref="moved">
        <span>可拖动留言板</span>
      </div>
      <!-- 信息 -->
      <record-list class="message-board" :record="recordlist"/>
      <!-- 内容 -->
      <div class="bottom-board">
        <el-button
          class="expression"
          type="text"
          @click="showDialog = !showDialog"
        >
          <img src="~assets/image/emoji.svg" alt="" />
        </el-button>
        <el-button class="photo" type="text" @click="open">
          <img width="28" src="~assets/image/photo.svg" alt="" />
        </el-button>
        <el-button class="scissors" type="text" @click="open">
          <img width="26" src="~assets/image/042剪刀-1.svg" alt="" />
        </el-button>
        <el-button class="file" type="text" @click="open">
          <img width="26" src="~assets/image/文件夹.svg" alt="" />
        </el-button>
        <el-button class="more" type="text" @click="open">
          <img width="26" src="~assets/image/more.svg" alt="" />
        </el-button>
        <el-button class="time" type="text" @click="open">
          <img width="28" src="~assets/image/time.svg" alt="" />
        </el-button>
        <VEmojiPicker
          class="VEmojiPicker"
          @select="selectEmoji"
          v-show="showDialog"
        />
        <textarea v-model="message" id="message" cols="30" rows="10"></textarea>
        <button class="button" @click="sendOut">发送</button>
      </div>
    </vue-draggable-resizable>
  </div>
</template>

<script>
import { VEmojiPicker } from "v-emoji-picker";
import Cookie from "js-cookie";

import { getUserRecord,getUserRecordList } from "network/record.js";

import RecordList from 'components/content/record/RecordList.vue';

export default {
  inject: ["reload"],
  name: "Setting",
  components: { VEmojiPicker, RecordList },
  data() {
    return {
      width: 0,
      height: 0,
      x: 0,
      y: 0,
      showDialog: false,
      message: "",
      userimage: Cookie.get("userimage"),
      userName: this.$store.state.user.userName || Cookie.get("usernamed"),
      permissions:
        this.$store.state.user.permissions || Cookie.get("permissions"),
      recordlist: []
    };
  },
  created() {
    getUserRecordList().then(res => {
    this.recordlist.push(...res.record.tb_record)
    console.log(this.recordlist);
    })
  },
  methods: {
    sendOut() {
      if (this.message == "") {
        this.$message({
          message: "不能发送空的内容！",
          type: "warning",
        });
        return;
      }
      let record = {
        message: this.message,
        userimage: this.userimage,
        userName: this.userName,
        permissions: this.permissions,
      };
      let tb_record = this.$qs.stringify({ record });
      getUserRecord(tb_record).then((res) => {
        if (res.send.code == 3200) {
          this.$message({
            message: res.send.msg,
            type: "success",
          });
          this.reload();
        } else {
          this.$message({
            message: res.send.msg,
            type: "danger",
          });
        }
      });
    },
    open() {
      this.$message({
        message: "该功能未开放！",
        type: "warning",
      });
    },
    selectEmoji(emoji) {
      console.log(emoji);
    },
    onResize: function (x, y, width, height) {
      this.x = x;
      this.y = y;
      this.width = width;
      this.height = height;
    },
    onDrag: function (x, y) {
      this.x = x;
      this.y = y;
    },
    selectEmoji(emoji) {
      // 选择emoji后调用的函数
      var elInput = document.getElementById("message"); //获取输入框元素
      // console.log(elInput);
      var start = elInput.selectionStart; // 记录光标开始的位置
      var end = elInput.selectionEnd; // 记录选中的字符 最后的字符的位置
      if (start === undefined || end === undefined) return;
      var txt = elInput.value;
      // 将表情添加到选中的光标位置
      var result = txt.substring(0, start) + emoji.data + txt.substring(end);
      elInput.value = result; // 赋值给input的value
      // 重置光标位置
      elInput.focus();
      elInput.selectionStart = start + emoji.data.length;
      elInput.selectionEnd = start + emoji.data.length;
      this.message = result; // 赋值(注意这里一定要赋值给表情输入框绑定的那个值)
      this.showDialog = false;
    },
  },
};
</script>

<style lang="less" scoped>
#set {
  width: 100%;
  height: 100%;
}
.el-card {
  width: 100%;
  height: 100%;
}

.message {
  width: 900px;
  height: 650px;
  background-color: #fff;
  border-radius: 8px;
  position: relative;
  box-shadow: 0 0 15px rgb(168, 168, 168);
  border: 0;
}
.top-board {
  width: 100%;
  height: 50px;
  background-color: rgb(253, 181, 181);
  border-radius: 8px 8px 0 0;
  cursor: move;
  line-height: 50px;
  text-align: center;
  position: absolute;
  left: 0;
  top: 0;
}
.top-board span {
  font-weight: bold;
}
.bottom-board {
  width: 100%;
  height: 200px;
  background-color: rgb(255, 255, 255);
  border-top: 1px solid #eee;
  position: absolute;
  bottom: 0;
}

.bottom-board textarea {
  width: 780px;
  height: 120px;
  margin: 60px 0 0 20px;
  // background-color: #eee;
  border: none;
  outline: none;
  resize: none;
  border-radius: 15px;
  font-size: 20px;
}

.button {
  width: 120px;
  height: 40px;
  position: absolute;
  bottom: 15px;
  right: 50px;
  border: none;
  background-color: rgb(248, 183, 183);
  cursor: pointer;
}

.button:hover {
  background-color: rgb(255, 205, 205);
}

.expression {
  font-size: 24px;
  position: absolute;
  left: 18px;
}

.VEmojiPicker {
  position: absolute;
  top: 45px;
  left: 18px;
}

.photo {
  position: absolute;
  left: 54px;
  top: 2px;
}

.scissors {
  position: absolute;
  left: 100px;
  top: 3px;
}

.file {
  position: absolute;
  left: 141px;
  top: 3px;
}

.more {
  position: absolute;
  left: 185px;
  top: 4px;
}

.time {
  position: absolute;
  right: 15px;
}

.message-board {
  width: 100%;
  max-height: 400px;
  margin-top: 50px;
  position: absolute;
  z-index: -1;
  overflow: hidden;
  overflow-y: scroll;
}

.message-board::-webkit-scrollbar {

  display: none; /* Chrome Safari */

}
</style>