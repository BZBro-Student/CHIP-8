module Chip8
    class ChipOP
        #0nnn
        def System_Jump
            #noop - ignored by interpretor
        end
        #00E0
        def Display_Clear
        end
        #00EE
        def Return(pc, stack, sp)
            pc.write_register(0, stack.pop(sp))
        end
        #1nnn
        def Program_Jump(pc, address)
            pc.write_register(0,address)
        end
        #2nnn
        def Routine_Call(pc, stack, sp, address)
            stack.push(sp,pc.read_register(0))
            pc.write_register(0,address)
        end
        #3xkk
        def Skip_If_Equal(pc, gp_reg, reg_num, value)
            if gp_reg.read_register(reg_num) == value
                pc.write_register(0, pc.read_register(0) + 2)
            end
        end
        #4xkk
        def Skip_If_Not_Equal(pc, gp_reg, reg_num, value)
            if gp_reg.read_register(reg_num) != value
                pc.write_register(0, pc.read_register(0) + 2)
            end
        end
        #5xy0
        def Skip_If_Reg_Equal(pc, gp_reg, reg_num1, reg_num2)
            if gp_reg.read_register(reg_num1) == gp_reg.read_register(reg_num2)
                pc.write_register(0, pc.read_register(0) + 2)
            end
        end
    end
end