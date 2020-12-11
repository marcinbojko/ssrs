# Microsoft SQL Server 2017 Reporting Services

## Description

Create, deploy, and manage mobile and paginated reports
SQL Server Reporting Services is a solution that customers deploy on their own premises for creating, publishing, and managing reports, then delivering them to the right users in different ways, whether that’s viewing them in web browser, on their mobile device, or as an email in their in-box.

For SQL Server 2016, Reporting Services offers an updated suite of products:

* 'Traditional' paginated reports brought up to date, so you can create modern-looking reports, with updated tools and new features for creating them.
* New mobile reports with a responsive layout that adapts to different devices and the different ways you hold them.
* A modern web portal you can view in any modern browser. In the new portal, you can organize and display mobile and paginated Reporting Services reports and KPIs. You can also store Excel workbooks on the portal.

## Features

* Install and uninstall via Chocolatey
* Supports 64-bit version

## Changelog

### 2020-12-11

* version 14.0.600.1669

### 2020-02-04 Version 14.0.600.1453

* version 14.0.600.1453

### 2019-07-08 Version 14.0.600.1274

* version 14.0.600.1274

### 2019-02-17 Version 14.0.600.1109

* version 14.0.600.1109 from 12.02.2019

### 2018-11-05 Version 14.0.600.892

* version 14.0.600.892 from 12.09.2018

### 2018-05-15 Version 14.0.600.744

* removed `chocolatey-core.extension` dependency
* added proper `iconurl`
* version 14.0.600.744 from 26.04.2018

### 2018-04-04 Version 14.0.600.689

* initial build

## Usage

### Package Parameters

* `/Edition=` - When installing you need to specify an edition
  * Eval
  * Expr
  * Dev

  If no edition is given package will install with `Dev` as default.

### Direct install

```cmd
choco install ssrs --params "/Edition=Eval|Expr|Dev"
```

### YAML (Foreman, puppetlabs/chocolatey module)

```yaml
ssrs:
  ensure: latest
  install_option:
  - '--params'
  - '"/Edition=Eval|Expr|Dev"'
```
