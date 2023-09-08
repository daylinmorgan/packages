import std/[json, os]


proc createPackagesJson(packagesDir: string, packagesJsonFile: string) =
  var packagesJson = newJArray()
  for packageFile in walkDir(packagesDir):
    let packageJson = parseJson(readFile(packageFile.path))
    packagesJson.add packageJson

  writeFile(packagesJsonFile, pretty(packagesJson))


when isMainModule:
  createPackagesJson("packages", "packages.json")

