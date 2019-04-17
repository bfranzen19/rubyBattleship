class Battleship
  BOARD_SIZE = 10
  BOARD_ROWS = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']

  # how the board looks
#^  #   0  1  2  3  4  5  6  7  8  9
#^  # A                  (c)
#|  # B            (b)(b)(c)
#|  # C                  (c)
#|  # D                  (c)       (b)
#Y  # E                  (c)       (b)
#|  # F   (b)(b)                   (b)
#|  # G                     (s)    (b)
#|  # H                     (s)
#|  # I                     (s)
#|  # J
 #  ---------- x --------------->>

# # TODO:
# initialize:
    # create a board
    # populate it with ships
    # name the cell with ship name (at A6, place a 'c')
# fire:
    # find cell by coords
    # hit:
        # replace the contents of the cell with a null/0/false/whatever
    # sink:
        # search for the corresponding letter found in the cell within the matrix
        # if none are found, return a message stating the ship name has been sunk


  def initialize(ships)
      @board = Hash.new
      (65.chr..74.chr).each do |letter|
          @board["#{letter}".to_sym] = []
          (0..9).each do |i|
              @board["#{letter}".to_sym][i] = false
          end
      end

      ships.each { |x|
          # set the start point, split into col and row and set to proper types
          st = x[:position]
          c = st[0].ord
          r = st[1].to_i

          # set the length and direction to variables and put zC into ascii to iterate easier
          l = x[:length]
          d = x[:direction]
          zC = x[:position].split("")[0].ord

          # set boat name to a variable
          name = x[:type]

          # if the direction matches, set the end point and iterate from start to end filling those cells with the name of the boat.
          if d == :south
              # set the end point
              zS = zC + l

              (c..zS).each do |y|
                  y = y.chr
                  y = y.to_sym
                  # place the name of the boat in that cell
                  @board[y][r] = name
              end
          elsif d == :north
              # set the end point
              zN = zC - l

              # place the name of the boat in that cell
              c.step(zN+1, -1) do |y|
                  y = y.chr
                  y = y.to_sym
                  @board[y][r] = name
              end
          elsif d == :east
              # set the end point
              zE = r + l
              c = c.chr.to_sym

              # place the name of the boat in that cell
              (r..zE-1).each do |y|
                  @board[c][y] = name
                  y = y + 1
              end
          else d == :west
              zW = r - l
              c = c.chr.to_sym

              # place the name of the boat in that cell
              r.step(zW+1, -1) do |y|
                  @board[c][y] = name
              end
          end
      }

      ### this was originally how i set up the board in the interest of time but it bothered me too much (and i was having too much fun) to hard code something like this so i created the above code to remedy this and dynamically load the board. thought it might give some insight into how i went about this challenge to leave it in here.

      # @board = {
      #     A: [false, false, false, false, false, false, :carrier, false, false, false],
      #     B: [false, false, false, false, :banana, :banana, :carrier, false, false, false],
      #     C: [false, false, false, false, false, false, :carrier, false, false, false],
      #     D: [false, false, false, false, false, false, :carrier, false, false, :battleship],
      #     E: [false, false, false, false, false, false, :carrier, false, false, :battleship],
      #     F: [false, false, false, false, false, false, false, false, false, :battleship],
      #     G: [false, false, false, false, false, false, false, :submarine, false, :battleship],
      #     H: [false, false, false, false, false, false, false, :submarine, false, false],
      #     I: [false, false, false, false, false, false, false, :submarine, false, false],
      #     J: [false, false, false, false, false, false, false, false, false, false],
      # }

  end

  def fire!(position)
      # split the position into column and row
      posArr = position.split("")

      # define the column and row in variables in the correct types
      posC = posArr[0].to_sym
      posR = posArr[1].to_i

      # look left from the position
      lookLeft = @board[posC][posR+1]

      # look right from the position
      lookRight = @board[posC][posR-1]

      # look up from the position
      up = position[0].ord-1
      upChr = up.chr.to_sym
      lookUp = @board[upChr][posR]

      # look down from the position
      down = position[0].ord+1
      downChr = down.chr.to_sym
      lookDown = @board[downChr][posR]

      # check if the missle hit anything. if it doesn't, return false.
      if position != false
          # store the boat name in a variable to return later
          boat = @board[posC][posR]

          # set the position to false so we don't have to track the number of hits per boat
          @board[posC][posR] = false

          # if the value in that cell is not false, change the type to a symbol. if the cell is false, return false.
          if lookUp != false
              lookUp.to_sym
          elsif lookRight != false
              lookRight.to_sym
          elsif lookDown != false
              lookDown.to_sym
          elsif lookLeft != false
              lookLeft.to_sym
          else
              return false
          end

          # if any adjacent cell contains the boat name, it's a hit. return true that a boat was hit. if none of the adjacent cells contain the boat name, the boat is sank and return the boat name.
          if lookUp == boat || lookRight == boat || lookDown == boat || lookLeft == boat
            puts "just a hit, there's more to the #{boat}"
            return true
          else
            puts "you sank the #{boat}!"
            # return [true,boat]
            return boat
          end
      else
          puts "ha! you missed!"
          return false
      end
  end
end
