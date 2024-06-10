struct ReshapableArray{T,N,M,A<:AbstractArray{T,N},B<:AbstractArray{T,M}} <: AbstractArray{T,N}
    data::A
    bis::B
end

# accessors

parent(this::ReshapableArray) = this.data
reshaped(this::ReshapableArray) = this.bis

# interface

reshapable(this::AbstractArray, dims::Dims) =
    ReshapableArray(this, reshape(this, dims))

# array interface

size(this::ReshapableArray) = size(parent(this))

getindex(this::ReshapableArray{T,N}, indices::Vararg{Int,N}) where {T,N} =
    getindex(parent(this), indices...)

setindex!(this::ReshapableArray{T,N}, val, indices::Vararg{Int,N}) where {T,N} =
    setindex!(parent(this), val, indices...)

reshape(this::ReshapableArray, dims) = reshape(parent(this), dims)
reshape(this::ReshapableArray{T,N,M}, ::NColon{M}) where {T,N,M} = reshaped(this)
