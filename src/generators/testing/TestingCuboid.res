open Generator

let drawLine2 = (
  from: Builder.position,
  to: Builder.position,
  ~color: string="#000000",
  ~width: int=1,
  ~pattern: array<int>=[],
  ~offset: int=0,
  (),
) => {
  model := Generator_Builder.drawLine(model.contents, from, to, ~color, ~width, ~pattern, ~offset)
}

let drawLinePath2 = (
  points: array<Builder.position>,
  ~color: string="#000000",
  ~width: int=1,
  ~pattern: array<int>=[],
  ~offset: int=0,
  ~close: bool=false,
  (),
) => {
  model :=
    Generator_Builder.drawPath(model.contents, points, ~color, ~width, ~pattern, ~offset, ~close)
}

let drawLineRect2 = (
  dest: Builder.rectangle,
  ~color: string="#000000",
  ~width: int=1,
  ~pattern: array<int>=[],
  ~offset: int=0,
  (),
) => {
  let (x, y, w, h) = dest
  model :=
    Generator_Builder.drawPath(
      model.contents,
      [(x, y), (x + w, y), (x + w, y + h), (x - 1, y + h), (x - 1, y)],
      ~color,
      ~width,
      ~pattern,
      ~offset,
      ~close=false,
    )
}

let drawLineCuboid2 = (
  position: Builder.position,
  scale: (int, int, int),
  ~color: string="#000000",
  ~color2: string="#000000",
  ~width: int=1,
  ~pattern: array<int>=[],
  ~pattern2: array<int>=[],
  ~offset: int=0,
  ~offset2: int=0,
  //~leftSide: bool=false,
  mode: int,
) => {
  let (x, y) = position
  let (w, h, l) = scale

  // from top to bottom - cut
  // from left to right - fold
  // center square - fold
  // right edge - cut
  // second right edge - fold

  switch mode {
  | 0 => {
      drawLinePath2(
        [(x + l - 1, y + l), (x + l - 1, y), (x + l + w, y), (x + l + w, y + l)],
        ~color,
        ~width,
        ~pattern,
        ~offset,
        (),
      )
      drawLinePath2(
        [
          (x + l - 1, y + l + h),
          (x + l - 1, y + l * 2 + h + 1),
          (x + l + w, y + l * 2 + h + 1),
          (x + l + w, y + l + h),
        ],
        ~color,
        ~width,
        ~pattern,
        ~offset,
        (),
      )
      drawLinePath2(
        [
          (x + l * 2 + w * 2, y + l - 1),
          (x - 1, y + l - 1),
          (x - 1, y + l + h + 1),
          (x + l * 2 + w * 2, y + l + h + 1),
        ],
        ~color=color2,
        ~width,
        ~pattern=pattern2,
        ~offset=offset2,
        (),
      )
      drawLineRect2(
        (x + l, y + l, w, h),
        ~color=color2,
        ~width,
        ~pattern=pattern2,
        ~offset=offset2,
        (),
      )
      drawLine2(
        (x + l * 2 + w - 1, y + l),
        (x + l * 2 + w - 1, y + l + h),
        ~color=color2,
        ~width,
        ~pattern=pattern2,
        ~offset=offset2,
        (),
      )
      drawLine2(
        (x + l * 2 + w * 2, y + l),
        (x + l * 2 + w * 2, y + l + h),
        ~color,
        ~width,
        ~pattern,
        ~offset,
        (),
      )
    }
  | 1 => {
      drawLinePath2(
        [
          // Part 1
          (x + l + w, y + l),
          (x + l + w, y - 1),
          (x + l - 1, y - 1),
          (x + l - 1, y + l - 1),
          (x - 1, y + l - 1),
          (x - 1, y + l + h + 1),
          // Part 2
          (x + l - 1, y + l + h + 1),
          (x + l - 1, y + l * 2 + h + 1),
          (x + l + w, y + l * 2 + h + 1),
          (x + l + w, y + l + h + 1),
          // Part 3
          (x + l * 2 + w * 2, y + l + h + 1),
          (x + l * 2 + w * 2, y + l),
        ],
        ~color,
        ~width,
        ~pattern,
        ~offset,
        ~close=true,
        (),
      )
      drawLineRect2(
        (x + l, y + l, w, h),
        ~color=color2,
        ~width,
        ~pattern=pattern2,
        ~offset=offset2,
        (),
      )
      drawLine2(
        (x + l * 2 + w - 1, y + l),
        (x + l * 2 + w - 1, y + l + h),
        ~color=color2,
        ~width,
        ~pattern=pattern2,
        ~offset=offset2,
        (),
      )
    }
  | _ => Generator.drawFoldLineCuboid(position, scale, ())
  }
}
