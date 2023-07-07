#!/usr/bin/env just --justfile

_ver := "0.0.1"
pkg_name := "archy-git-aliases"
build_dir := justfile_directory() / "build"
temp_dir := build_dir / "temp"
pkg_build := justfile_directory() / "pkg" / pkg_name / "PKGBUILD"
install_target := "/etc"


alias b := build
alias sums := update-checksums
alias ver := update-pkgver
alias r := release
alias i := install

default: install

build ver=_ver:
  @if [[ ! -d {{build_dir}} ]]; then mkdir -p {{build_dir}}; fi
  @if [[ -d {{temp_dir}} ]]; then rm -rf {{temp_dir}}; fi
  
  mkdir -p {{temp_dir}}
  cp archyGitAliases justfile patch.sh {{temp_dir}}

  tar czf {{build_dir}}/{{pkg_name}}_{{ver}}.tar.gz --directory={{temp_dir}} .
  rm -rf {{temp_dir}}

update-checksums ver=_ver: (build ver)
  #!/usr/bin/env sh
  set -euxo pipefail
  new_md5sum_value=$(md5sum {{build_dir}}/{{pkg_name}}_{{ver}}.tar.gz | cut -d ' ' -f1)
  sed -i '/^md5sums=/c\md5sums=(\"'$new_md5sum_value'\")' {{pkg_build}}

update-pkgver ver=_ver:
  sed -i '/^pkgver=/c\pkgver={{ver}}' {{pkg_build}}
  sed -i '/^_ver :=/c\_ver := "{{ver}}"' {{justfile()}}

@_commit ver=_ver:
  git commit -am "chore(version): bump version to {{ver}}"
  git push

release ver=_ver: (update-pkgver ver) (update-checksums ver) (build ver) (_commit ver)
  gh release create --generate-notes {{ver}}
  gh release upload {{ver}} {{build_dir}}/{{pkg_name}}_{{ver}}.tar.gz
  @echo "done."

@_patch target:
  ./patch.sh {{target}}

install target=install_target: && (_patch target)
  cp ./archyGitAliases {{target}}

@_unpatch target:
  ./unpatch.sh {{target}}

uninstall target=install_target: (_unpatch target)
  rm {{target}}/archyGitAliases

