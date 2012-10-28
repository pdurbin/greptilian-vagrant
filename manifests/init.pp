stage { 'repos': before => Stage['packages'] }

stage { 'packages': before => Stage['main'] }

stage { 'last': require => Stage['main'] }

class {
    'repos':  stage => repos;
    'packages': stage => packages;
    'server1': stage => main;
    'last': stage => last;
}
