import std/[json, os]

proc spiltPackagesJson(packagesFile: string) =
  createDir("packages")
  let packagesJson = parseJson(readFile(packagesFile))
  for pkg in packagesJson:
    let name = pkg.getOrDefault("name").getStr()
    writeFile("packages" / name & ".json", $pkg)

when isMainModule:
  spiltPackagesJson("packages.json")
