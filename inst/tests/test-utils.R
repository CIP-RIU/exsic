context("Remove final dot")

expect_that( strip.final.dot() == "", is_true() )
#expect_that( remove.final.dot(x) == "", is_true() )
expect_that( strip.final.dot("") == "", is_true() )
expect_that( strip.final.dot(".") == "", is_true() )

expect_that( strip.final.dot("test.") == "test", is_true() )
expect_that( strip.final.dot("test") == "test", is_true() )
expect_that( strip.final.dot(".test") == ".test", is_true() )
expect_that( strip.final.dot("test. ") == "test", is_true() )
expect_that( strip.final.dot("test.  ") == "test", is_true() )


context("Collector citation")

expect_that( coll.cite("Simon") == "Simon", is_true() )
expect_that( coll.cite("Simon, R", initials="before", dots = FALSE) == "R Simon", is_true() )
expect_that( coll.cite("Simon, R", initials="before", dots = TRUE) == "R. Simon", is_true() )
expect_that( coll.cite("Simon, R", initials="none", dots = FALSE) == "Simon", is_true() )
expect_that( coll.cite("Simon, R","Spooner, DM", initials="none") == "Simon & Spooner", is_true() )
expect_that( coll.cite("Simon, R","Spooner", initials="none") == "Simon & Spooner", is_true() )
expect_that( coll.cite("Simon, R","", initials="none") == "Simon", is_true() )
expect_that( coll.cite("Simon, R","Spooner, DM", initials="before") == "R. Simon & D.M. Spooner", is_true() )
expect_that( coll.cite("Simon, R","Spooner, DM", initials="before", dots=FALSE) == "R Simon & DM Spooner", is_true() )
expect_that( coll.cite("Simon, R","Spooner, DM; Third, AB", initials="before", dots=FALSE) == "R Simon et al.", is_true() )
expect_that( coll.cite("Simon, R","Spooner, DM; Third, AB") == "Simon et al.", is_true() )
expect_that( coll.cite("Simon, R","Spooner, DM; Third, AB", initials="before") == "R. Simon et al.", is_true() )

