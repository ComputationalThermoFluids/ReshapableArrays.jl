module ReshapableArrays

import Base: parent,
             reshape,
             size,
             getindex,
             setindex!

export NColon,
       ncolon,
       reshapable

const NColon{N} = NTuple{N,Colon}

ncolon(::Val{N}) where {N} = ntuple(Returns(:), Val(N))

reshape(this::AbstractArray{T,N}, ::NColon{N}) where {T,N} = this

include("arrays.jl")

end
