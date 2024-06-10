using ReshapableArrays
using Test

@testset "ReshapableArrays.jl" begin
    x = reshapable(rand(4, 8, 16), (16, 32))
    y = reshape(x, (:, :))

    @test isequal(x[2, 2, 2], y[6, 3])
end
