stage {
  'repos': before => Stage['main'],
}

class {
    'repos':  stage => repos;
    'server1': stage => main;
}
