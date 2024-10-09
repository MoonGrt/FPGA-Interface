**English | [简体中文](README_cn.md)**
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
    The FPGA-Comm_Interface repository contains commonly used FPGA communication modules for future development and integration. Each module is equipped with corresponding testbench files to ensure completeness and reliability.
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
  <summary>Contents</summary>
  <ol>
    <li><a href="#file-tree">File Tree</a></li>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>





<!-- FILE TREE -->
## File Tree

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



<!-- ABOUT THE PROJECT -->
## About The Project

<p>
  The FPGA-Comm_Interface repository is a comprehensive library of communication modules specifically designed for FPGA developers, aimed at providing convenient FPGA communication solutions. This repository aggregates a variety of commonly used communication interface modules, allowing developers to quickly integrate them into different projects. Each module is equipped with corresponding testbench files, assisting users in verifying functionality and performance, ensuring system stability and reliability.
</p>

<h3>Description</h3>
<p>This repository includes the following communication modules, each accompanied by detailed documentation and test examples to help users better understand and utilize them:</p>
<ul>
  <li><strong>JTAG</strong>: 
    JTAG (Joint Test Action Group) is a widely used debugging and programming interface that supports various programming tools and debuggers. This module allows users to easily interact with the FPGA, perform online debugging, and programming, enhancing development efficiency.
  </li>
  <li><strong>CAN</strong>: 
    CAN (Controller Area Network) is a highly reliable serial communication protocol, particularly suited for automotive and industrial automation systems. This module provides a complete implementation of the CAN communication protocol, including sending, receiving, and error handling functionalities, making it ideal for embedded applications that require real-time responsiveness.
  </li>
  <li><strong>IIC</strong>: 
    I²C (Inter-Integrated Circuit) is a two-wire serial communication protocol widely used for various low-speed peripheral communications. This module supports master-slave mode communication, making it suitable for connections between sensors, memory, and other devices. Users can adjust the data rate and communication parameters according to their needs.
  </li>
  <li><strong>SPI</strong>: 
    SPI (Serial Peripheral Interface) is a high-speed synchronous serial communication protocol suitable for high-speed data transfer scenarios. This module supports full-duplex communication, allowing users to easily configure connections with a variety of external devices, making it particularly suitable for data acquisition and signal processing applications.
  </li>
  <li><strong>UART</strong>: 
    UART (Universal Asynchronous Receiver-Transmitter) is a classic serial communication protocol widely used for data transmission between microcontrollers and computers. This module supports configurable baud rates and data bit settings, making it suitable for wireless communication and various serial devices.
  </li>
</ul>
<p>
  Each module not only includes core functionality implementations but also comes with testbench files to help developers verify functionality, performance, and stability. Users can modify and extend them according to their project needs, improving development efficiency and shortening project cycles.
</p>

<p align="right">(<a href="#top">top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.
If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!
1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
<p align="right">(<a href="#top">top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.
<p align="right">(<a href="#top">top</a>)</p>



<!-- CONTACT -->
## Contact

MoonGrt - 1561145394@qq.com
Project Link: [MoonGrt/](https://github.com/MoonGrt/)
<p align="right">(<a href="#top">top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

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

