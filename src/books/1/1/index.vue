<template>
  <div>
    <h1>我是第一章组件</h1>
    <a-button type="primary" @click="openWin">弹出新的窗口</a-button>
    <a-button type="primary" @click="moveWin">移动窗口</a-button>
    <a-button type="primary" @click="resizeWin">缩放窗口</a-button>
    <a-button type="primary" @click="closeWin">关闭窗口</a-button>

  </div>
</template>

<script setup lang="ts">
function openWin() {
  window.open("/", '_blank')
}
function moveWin() {
  window.moveTo(0,0)
}
function resizeWin() {
  window.resizeTo(80, 60)
}
function closeWin() {
  close()
}
</script>

<style scoped>
:deep(.ant-btn) {
  margin: 5px
}
</style>