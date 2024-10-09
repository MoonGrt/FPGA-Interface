**简体中文 | [English](README.md)**
<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
    <a href="https://github.com/MoonGrt/FPGA-Comm_Interface">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
    </a>
<h3 align="center">FPGA-Comm_Interface</h3>
    <p align="center">
    FPGA-Comm_Interface仓库收录了常用的FPGA通信模块，便于日后开发和集成。每个模块都包含相应的测试平台文件（testbench），确保代码功能完整和可靠。
    <br />
    <a href="https://github.com/MoonGrt/FPGA-Comm_Interface"><strong>Explore the docs »</strong></a>
    <br />
    <a href="https://github.com/MoonGrt/FPGA-Comm_Interface">View Demo</a>
    ·
    <a href="https://github.com/MoonGrt/FPGA-Comm_Interface/issues">Report Bug</a>
    ·
    <a href="https://github.com/MoonGrt/FPGA-Comm_Interface/issues">Request Feature</a>
    </p>
</div>




<!-- CONTENTS -->
<details open>
  <summary>目录</summary>
  <ol>
    <li><a href="#文件树">文件树</a></li>
    <li>
      <a href="#关于本项目">关于本项目</a>
      <ul>
      </ul>
    </li>
    <li><a href="#贡献">贡献</a></li>
    <li><a href="#许可证">许可证</a></li>
    <li><a href="#联系我们">联系我们</a></li>
    <li><a href="#致谢">致谢</a></li>
  </ol>
</details>





<!-- 文件树 -->
## 文件树

```
└─ Project
  ├─ LICENSE
  ├─ README.md
  ├─ /CAN/
  │ ├─ sim
  │ └─ /src/
  │   └─ can_rx.v
  ├─ /IIC/
  │ ├─ sim
  │ └─ /src/
  │   ├─ i2c_edid.v
  │   ├─ i2c_OV7670_RGB565_config.v
  │   ├─ i2c_timing_ctrl.v
  │   └─ ram_init_file.mem
  ├─ /images/
  ├─ /JTAG/
  │ ├─ sim
  │ └─ /src/
  │   ├─ defines.v
  │   ├─ full_handshake_rx.v
  │   ├─ full_handshake_tx.v
  │   ├─ jtag_dm.v
  │   ├─ jtag_driver.v
  │   ├─ jtag_top.v
  │   └─ top.v
  ├─ /SPI/
  │ ├─ sim
  │ └─ /src/
  │   ├─ gamepad.vhd
  │   ├─ spi.v
  │   └─ spi_driver.v
  └─ /UART/
    ├─ /sim/
    │ └─ top_tb.v
    └─ /src/
      ├─ print.vh
      ├─ top.v
      ├─ uart_rx.v
      └─ uart_tx.v
```



<!-- 关于本项目 -->
## 关于本项目

<p>
  FPGA-Comm_Interface仓库是一个专为FPGA开发者设计的综合性通信模块库，旨在提供便捷的FPGA通信解决方案。该仓库汇集了多种常用的通信接口模块，方便开发者在不同的项目中快速集成。每个模块均配有相应的测试平台文件（testbench），帮助用户验证功能和性能，确保系统的稳定性与可靠性。
</p>

<h3>描述</h3>
<p>该仓库包含以下通信模块，每个模块均配有详细的文档和测试示例，帮助用户更好地理解和使用：</p>
<ul>
  <li><strong>JTAG</strong>: 
    JTAG（联合测试行动小组）是一种广泛使用的调试和编程接口，支持多种编程工具与调试器。该模块允许用户轻松地与FPGA进行交互，进行在线调试和烧录，提升开发效率。
  </li>
  <li><strong>CAN</strong>: 
    CAN（控制器局域网络）是一种高可靠性的串行通信协议，特别适用于汽车和工业自动化系统。该模块提供了完整的CAN通信协议实现，包括发送、接收和错误处理功能，非常适合需要实时响应的嵌入式应用。
  </li>
  <li><strong>IIC</strong>: 
    I²C（Inter-Integrated Circuit）是一种双线制串行通信协议，广泛应用于各种低速外围设备的通信。该模块支持主从模式的通信，适用于传感器、存储器和其他设备之间的连接，用户可以根据需求调整数据速率和通信参数。
  </li>
  <li><strong>SPI</strong>: 
    SPI（串行外设接口）是一种高速的同步串行通信协议，适用于高速数据传输的场合。该模块支持全双工通信，用户可以通过简单的配置实现与多种外部设备的连接，特别适合数据采集和信号处理应用。
  </li>
  <li><strong>UART</strong>: 
    UART（通用异步收发器）是一种经典的串行通信协议，广泛应用于微控制器与计算机之间的数据传输。该模块支持可配置的波特率和数据位设置，适合用于无线通信和各种串口设备。
  </li>
</ul>
<p>
  每个模块不仅包含核心功能实现，还附带测试平台文件，帮助开发者验证功能、性能和稳定性。用户可以根据自己的项目需求进行修改和扩展，提高开发效率，缩短项目周期。
</p>

<p align="right">(<a href="#top">top</a>)</p>



<!-- 贡献 -->
## 贡献

贡献让开源社区成为了一个非常适合学习、互相激励和创新的地方。你所做出的任何贡献都是**受人尊敬**的。

如果你有好的建议，请复刻（fork）本仓库并且创建一个拉取请求（pull request）。你也可以简单地创建一个议题（issue），并且添加标签「enhancement」。不要忘记给项目点一个 star！再次感谢！

1. 复刻（Fork）本项目
2. 创建你的 Feature 分支 (`git checkout -b feature/AmazingFeature`)
3. 提交你的变更 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到该分支 (`git push origin feature/AmazingFeature`)
5. 创建一个拉取请求（Pull Request）
<p align="right">(<a href="#top">top</a>)</p>



<!-- 许可证 -->
## 许可证

根据 MIT 许可证分发。打开 [LICENSE](LICENSE) 查看更多内容。
<p align="right">(<a href="#top">top</a>)</p>



<!-- 联系我们 -->
## 联系我们

MoonGrt - 1561145394@qq.com
Project Link: [MoonGrt/FPGA-Comm_Interface](https://github.com/MoonGrt/FPGA-Comm_Interface)

<p align="right">(<a href="#top">top</a>)</p>



<!-- 致谢 -->
## 致谢

在这里列出你觉得有用的资源，并以此致谢。我已经添加了一些我喜欢的资源，以便你可以快速开始！

* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
* [Malven's Grid Cheatsheet](https://grid.malven.co/)
* [Img Shields](https://shields.io)
* [GitHub Pages](https://pages.github.com)
* [Font Awesome](https://fontawesome.com)
* [React Icons](https://react-icons.github.io/react-icons/search)
<p align="right">(<a href="#top">top</a>)</p>




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/MoonGrt/FPGA-Comm_Interface.svg?style=for-the-badge
[contributors-url]: https://github.com/MoonGrt/FPGA-Comm_Interface/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/MoonGrt/FPGA-Comm_Interface.svg?style=for-the-badge
[forks-url]: https://github.com/MoonGrt/FPGA-Comm_Interface/network/members
[stars-shield]: https://img.shields.io/github/stars/MoonGrt/FPGA-Comm_Interface.svg?style=for-the-badge
[stars-url]: https://github.com/MoonGrt/FPGA-Comm_Interface/stargazers
[issues-shield]: https://img.shields.io/github/issues/MoonGrt/FPGA-Comm_Interface.svg?style=for-the-badge
[issues-url]: https://github.com/MoonGrt/FPGA-Comm_Interface/issues
[license-shield]: https://img.shields.io/github/license/MoonGrt/FPGA-Comm_Interface.svg?style=for-the-badge
[license-url]: https://github.com/MoonGrt/FPGA-Comm_Interface/blob/master/LICENSE

