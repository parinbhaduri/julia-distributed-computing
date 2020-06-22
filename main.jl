using Distributed

# add processes on the same machine
addprocs(4, topology=:master_worker, exeflags="--project=$(Base.active_project())")

# SETUP FOR ALL PROCESSES
# -----------------------
@sync @everywhere begin
  # instantiate environment
  using Pkg; Pkg.instantiate()

  # load dependencies
  using CSV

  # HELPER FUNCTIONS
  # ----------------
  function process(infile, outfile)
    # read file from disk
    csv = CSV.read(infile)

    # perform calculations
    csv.new = rand(size(csv,1))

    # save new file to disk
    CSV.write(outfile, csv)
  end
end

# MAIN SCRIPT
# -----------

# relevant directories
indir  = joinpath(@__DIR__,"data")
outdir = joinpath(@__DIR__,"results")

# files to process
infiles  = readdir(indir, join=true)
outfiles = joinpath.(outdir, basename.(infiles))
nfiles   = length(infiles)

status = pmap(1:nfiles) do i
  try
    process(infiles[i], outfiles[i])
    true # success
  catch e
    @warn "failed to process $(infiles[i])"
    false # failure
  end
end