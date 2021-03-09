# PowerShell Function to Read Config Params from INI File

## Summary
PowerShell function (Get-IniFile-Function.ps1) and example PowerShell script (MyProgram.ps1) that uses the Get-IniFile Function to read configuration parameters from config.ini

_Note: If you have any questions or comments you can always use GitHub discussions, or DM me on the twitter @rbocchinfuso._

#### Why
Assist in refactoring PowerShell code; removing all configuration parameters from the source code and placing them in INI files.


## Requirements
- PowerShell >= v2

## Usage
- Download code from GitHub
```git clone https://github.com/CC-Digital-Innovation/Get-IniFile-Function.git```
- Note:  If you don't have Git installed you can also just grab the zip:
[https://github.com/CC-Digital-Innovation/Get-IniFile-Function/archive/master.zip](https://github.com/CC-Digital-Innovation/Get-IniFile-Function/archive/master.zip)
- Identify all constants and variable that should be removed from your source code
- Logically organize constants and variable in to sections containing key:value pairs
- Edit config.ini, create the appropriate sections, start adding key value pairs.
  - _Remember all your sensitive data will now be stored in the config.ini, be sure that your .gitignore file excludes .ini files, and be sure to create a config.ini.example file with bogus data so that others can follow your construct._
- Dot Source Get-IniFile-Function.ps1 function from from your source
  - _See line 30 of MyProgam.ps1 for an example_
```
# Dot Source required Function Libraries
. ".\Get-IniFile-Function.ps1"
```

- Read the config.ini file from your source using the Get-IniFile function

_Note:  If you use a different ini file name, than config.ini you will need to reflect the filename and path below_

```
# Get config parameters from config.ini
$configIni = Get-IniFile .\config.ini
```

- Call config.ini variables from your source

```
$configIni.[SECTION].[KEY]
E.g. - 	$configIni.Locations.LogFile
```
_Note:  See MyProgram.ps1 for more examples_


## Compatibility
This is only tested on Windows and most likely will only work on Windows. It should be possible to support PowerShell Core on Linux with only minor adjustments so leave a feature request if there is any interest in that.

## Disclaimer
The code provided in this project is an open source example and should not be treated as an officially supported product. Use at your own risk. If you encounter any problems, please log an [issue](https://github.com/CC-Digital-Innovation/Get-IniFile-Function/issues).


## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request ツ

## History
-  version 0.1.0 (initial release) - 2021/03/06

## Credits
Rich Bocchinfuso <<rbocchinfuso@gmail.com>>

## License	
MIT License

Copyright (c) [2021] [Richard J. Bocchinfuso]

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.