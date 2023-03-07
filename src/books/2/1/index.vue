<template class="component">
  <h2>常见的水平垂直居中方案</h2>
  <a-divider orientation="left">只有一行文字</a-divider>
  <a-row>
    <a-col :span="12">
      <div class="box text-center line-height">
        <span class="inline">我是一行文字</span>
      </div>
    </a-col>
    <a-col :span="12">
      <div class="boundless table">
        <div class="inline table-cell">我是一行文字, table</div>
      </div>
    </a-col>
  </a-row>
  <a-row>
    <a-col :span="12">
      <div class="boundless grid">
        <span class="inline">我是一行文字, grid</span>
      </div>
    </a-col>
    <a-col :span="12">
      <div class="boundless write text-center">
        <span class="inline">我是一行文字;write</span>
      </div>
    </a-col>
  </a-row>
  <a-divider orientation="left">多行文字</a-divider>
  <a-row>
    <a-col :span="12">
      <div class="boundless table">
        <span class="mutil-inline table-cell">我是多行文字啊;table<br/>我是多行文字啊;table</span>
      </div>
    </a-col>
    <a-col :span="12">
      <div class="boundless grid">
        <span class="mutil-inline">我是多行文字;grid<br/>我是多行文字啊;grid</span>
      </div>
    </a-col>
  </a-row>
  <a-divider orientation="left">块级，子元素宽高固定</a-divider>
  <a-row>
    <a-col :span="12">
      <div class="box relative">
        <div class="child absolute mt ml"></div>
      </div>
    </a-col>
    <a-col :span="12">
      <div class="boundless relative">
        <div class="child absolute m-auto"></div>
      </div>
    </a-col>
  </a-row>
  <a-divider orientation="left">块级，父元素宽高不固定，子元素宽高固定</a-divider>
  <a-row>
    <a-col :span="12">
      <div class="boundless grid">
        <div class="child">grid</div>
      </div>
    </a-col>
    <a-col :span="12">
      <div class="boundless table">
        <div class="child">table布局不可行</div>
      </div>
    </a-col>
  </a-row>
  <a-divider orientation="left">块级，子元素宽高不固定</a-divider>
  <a-row>
    <a-col :span="12">
      <div class="box grid">
        <div class="in-valid">grid</div>
      </div>
    </a-col>
    <a-col :span="12">
      <div class="box relative">
        <div class="in-valid absolute tt tl">transform</div>
      </div>
    </a-col>
  </a-row>
  <a-divider orientation="left">块级，父元素宽高不固定， 子元素宽高固定</a-divider>
  <a-row>
    <a-col :span="12">
      <div class="boundless grid">
        <div class="in-valid">grid</div>
      </div>
    </a-col>
    <a-col :span="12">
      <div class="boundless relative">
        <div class="in-valid absolute tt tl">transform, transform</div>
      </div>
    </a-col>
  </a-row>
</template>

<script lang="ts" setup>
</script>

<style lang="less" scoped>


.box {
  width: 150px;
  height: 150px;
  background-color: gray;
  border: 1px solid black;
  text-align: left;
  &.line-height {
    line-height: 150px;
  }
}
.text-center {
  text-align: center;
}
.child {
  width: 50px;
  height: 50px;
  background-color: rosybrown;
}
.in-valid {
  background-color: aqua;
}
.mt {
  top: 50%;
  margin-top: -25px;
}
.ml {
  left: 50%;
  margin-left: -25px;
}
.tt {
  top: 50%;
  transform: translate(-50%, -50%)
}
.tl {
  left: 50%;
  // transform: translateX(-50%)
}
.m-auto {
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
}
.boundless {
  height: 150px; /** 模拟高度，这个高度不可用 */
  background-color: skyblue;
  border: 1px solid black;
  
  &.write {
    width: 100%;
    writing-mode: vertical-lr;
    .inline {
      writing-mode: horizontal-tb;
    }
  }
}
.table {
  display: table;
  width: 100%;
  &>span {
    display: table-cell;
    vertical-align: middle;
  }
  &>div {
    display: table-cell;
    vertical-align: middle;
  }
}
.grid {
  display: grid;
  &>span {
    margin: auto
  }
  &>div {
    margin: auto
  }
}
.relative {
  position: relative;
}
.absolute {
  position: absolute
}
</style>
