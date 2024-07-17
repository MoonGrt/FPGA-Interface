<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
	<a href="https://github.com/MoonGrt/FPGA-Comm_interface">
	<img src="images/logo.png" alt="Logo" width="80" height="80">
	</a>
<h3 align="center">FPGA-Comm_interface</h3>
	<p align="center">
	This FPGA project features a comprehensive implementation of multiple communication interfaces, including UART, IIC, SPI, and CAN. The UART interface notably supports direct "print" functionality, making it easier to output data and messages directly from the FPGA. This project showcases robust and versatile data exchange capabilities, suitable for a wide range of applications requiring reliable and efficient communication protocols.
	<br />
	<a href="https://github.com/MoonGrt/FPGA-Comm_interface"><strong>Explore the docs »</strong></a>
	<br />
	<br />
	<a href="https://github.com/MoonGrt/FPGA-Comm_interface">View Demo</a>
	·
	<a href="https://github.com/MoonGrt/FPGA-Comm_interface/issues">Report Bug</a>
	·
	<a href="https://github.com/MoonGrt/FPGA-Comm_interface/issues">Request Feature</a>
	</p>
</div>


<!-- CONTENTS -->
<details open>
  <summary>Contents</summary>
  <ol>
    <li><a href="#file-tree">File Tree</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

└─ Project
  ├─ README.md
  ├─ /CAN/
  ├─ /IIC/
  │ └─ /IIC.srcs/
  │   ├─ sim_1
  │   └─ /sources_1/
  │     ├─ i2c_edid.v
  │     ├─ i2c_OV7670_RGB565_config.v
  │     ├─ i2c_timing_ctrl.v
  │     └─ ram_init_file.mem
  ├─ /SPI/
  └─ /UART_print/
    └─ /UART_print.srcs/
      ├─ /sim_1/
      │ └─ top_tb.v
      └─ /sources_1/
        ├─ print.vh
        ├─ top.v
        ├─ uart_rx.v
        └─ uart_tx.v
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
[contributors-shield]: https://img.shields.io/github/contributors/MoonGrt/FPGA-Comm_interface.svg?style=for-the-badge
[contributors-url]: https://github.com/MoonGrt/FPGA-Comm_interface/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/MoonGrt/FPGA-Comm_interface.svg?style=for-the-badge
[forks-url]: https://github.com/MoonGrt/FPGA-Comm_interface/network/members
[stars-shield]: https://img.shields.io/github/stars/MoonGrt/FPGA-Comm_interface.svg?style=for-the-badge
[stars-url]: https://github.com/MoonGrt/FPGA-Comm_interface/stargazers
[issues-shield]: https://img.shields.io/github/issues/MoonGrt/FPGA-Comm_interface.svg?style=for-the-badge
[issues-url]: https://github.com/MoonGrt/FPGA-Comm_interface/issues
[license-shield]: https://img.shields.io/github/license/MoonGrt/FPGA-Comm_interface.svg?style=for-the-badge
[license-url]: https://github.com/MoonGrt/FPGA-Comm_interface/blob/master/LICENSE

