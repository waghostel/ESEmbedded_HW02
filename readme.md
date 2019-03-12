HW02
===
This is the hw02 sample. Please follow the steps below.

# Build the Sample Program

1. Fork this repo to your own github account.

2. Clone the repo that you just forked.

3. Under the hw02 dir, use:

	* `make` to build.

	* `make clean` to clean the ouput files.

4. Extract `gnu-mcu-eclipse-qemu.zip` into hw02 dir. Under the path of hw02, start emulation with `make qemu`.

	See [Lecture 02 ─ Emulation with QEMU] for more details.

5. The sample is designed to help you to distinguish the main difference between the `b` and the `bl` instructions.  

	See [ESEmbedded_HW02_Example] for knowing how to do the observation and how to use markdown for taking notes.

# Build Your Own Program

1. Edit main.s.

2. Make and run like the steps above.

# HW02 Requirements

1. Please modify main.s to observe the `push` and the `pop` instructions:  

	Does the order of the registers in the `push` and the `pop` instructions affect the excution results?  

	For example, will `push {r0, r1, r2}` and `push {r2, r0, r1}` act in the same way?  

	Which register will be pushed into the stack first?

2. You have to state how you designed the observation (code), and how you performed it.  

	Just like how [ESEmbedded_HW02_Example] did.

3. If there are any official data that define the rules, you can also use them as references.

4. Push your repo to your github. (Use .gitignore to exclude the output files like object files or executable files and the qemu bin folder)

[Lecture 02 ─ Emulation with QEMU]: http://www.nc.es.ncku.edu.tw/course/embedded/02/#Emulation-with-QEMU
[ESEmbedded_HW02_Example]: https://github.com/vwxyzjimmy/ESEmbedded_HW02_Example

--------------------

- [ ] **If you volunteer to give the presentation next week, check this.**

--------------------

Please take your note here.


# HW02




## **實驗一: 正常的push順序測試**
    push {r0,r1,r2}
    pop {r3,r4,r5}


在`push{r0, r1, r2}`後，暫存器中的`r0`  `r1`  `r2` 被寫入到stack記憶體空間，使記憶體中儲存狀態變成:

| **0x20000f4** | 1 |
| ------------- | - |
| **0x20000f8** | 2 |
| **0x20000fc** | 3 |



![](https://d2mxuefqeaa7sj.cloudfront.net/s_E60AD7C5995E29DFB1662A7B790E49D3D817ABA778B8CB253DD948D89282A05B_1552399219926_image.png)


在執行完`pop{r3, r4, r5}`以後，暫存器的`r3`  `r4`  `r5`被寫入存在`**0x20000f4**`， `**0x20000f8**` 及`**0x20000fc**`的值，sp重新指向`0x20000100`的初始位置。



----------
## **實驗二: 刻意修改的push順序的測試**
    push {r2,r0,r1} //刻意修改的push順序
    pop {r3,r4,r5}
![圖2](https://d2mxuefqeaa7sj.cloudfront.net/s_E60AD7C5995E29DFB1662A7B790E49D3D817ABA778B8CB253DD948D89282A05B_1552400635527_image.png)


由測試的結果可看出，雖然使用的指令為`push{r2,r0,r1}` 在GDB執行過程中的順序卻被修改成`push{r0,r1,r2}`了。


----------
## 結論
1. 從第一組實驗中可確認暫存器中的數值可經由push指令放入到`**0x20000f4**`， `**0x20000f8**` 及`**0x20000fc**` stack記憶體位置中。
2. 從第二組實驗中可發現`**push{r2,r0,r1}**`在執行時會被修改成`**push{r0,r1,r2}**`指令。


