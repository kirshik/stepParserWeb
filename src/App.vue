<script setup lang="ts">
import block from "./components/block.vue";
import data from "./components/STRUCTURE_Final.json";
import { ref } from "vue";

const pickedKey = ref<string>(Object.keys(data)[0]);
// ts-ignore: ignore
const description = ref<string>(String(data[pickedKey.value]?.description));

const handleClick = (item, key) => {
  pickedKey.value = key;
  description.value = item.description;
};
</script>

<template>
  <div class="container">
    <div class="left-sec">
      <ul>
        <block
          :accent="pickedKey"
          :data="data"
          v-slot="slotProps"
          @handleClick="(item, key) => handleClick(item, key)"
        >
          <block
            :accent="pickedKey"
            :data="slotProps?.child"
            v-slot="slotPropsChild"
            @handleClick="(item, key) => handleClick(item, key)"
          >
            <block
              :accent="pickedKey"
              :data="slotPropsChild?.child"
              v-slot="slotPropsChild2"
              @handleClick="(item, key) => handleClick(item, key)"
            >
              <block
                :accent="pickedKey"
                :data="slotPropsChild2?.child"
                v-slot="slotPropsChild3"
                @handleClick="(item, key) => handleClick(item, key)"
              >
                <block
                  :accent="pickedKey"
                  :data="slotPropsChild3?.child"
                  v-slot="slotPropsChild4"
                  @handleClick="(item, key) => handleClick(item, key)"
                >
                  <block
                    :accent="pickedKey"
                    :data="slotPropsChild4?.child"
                    v-slot="slotPropsChild5"
                  >
                    <block
                      :accent="pickedKey"
                      :data="slotPropsChild5?.child"
                      v-slot="slotPropsChild6"
                    >
                      <block
                        :accent="pickedKey"
                        :data="slotPropsChild6?.child"
                      />
                    </block>
                  </block>
                </block>
              </block>
            </block>
          </block>
        </block>
      </ul>
    </div>
    <div class="right-sec">{{ description }}</div>
  </div>
</template>

<style scoped>
.container {
  display: grid;
  grid-template-columns: min-content 1fr;
  min-width: 80vw;
  gap: 10px;
  border-collapse: collapse;
  border: 1px solid black;
  background-color: wheat;
  height: 100%;
  overflow: hidden;
}
.left-sec,
.right-sec {
  width: 100%;
  height: 100%;
  background-color: white;
}
.right-sec {
  padding-left: 20px;
  text-align: start;
  word-wrap: keep-all;
  white-space: pre-wrap;
}
</style>
